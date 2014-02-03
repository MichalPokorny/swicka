#include "ohlc_memory_provider.h"

OHLCMemoryProvider::OHLCMemoryProvider(QDateTime minimum, QDateTime maximum, int quantumSeconds) {
	this->minimum = minimum;
	this->maximum = maximum;
	this->quantumSeconds = quantumSeconds;

	data = vector<pair<OHLC, bool> >((maximum.toTime_t() - minimum.toTime_t()) / quantumSeconds + 1, make_pair(OHLC(), false));
}

long OHLCMemoryProvider::getTimeIndex(QDateTime time) {
	long start = getMinimum().toTime_t(), end = getMaximum().toTime_t();
	long t = time.toTime_t();
	
	if (t < start || t > end) throw "out of range";

	return (t - start) / quantumSeconds;
}

void OHLCMemoryProvider::addData(QDateTime start, OHLC tick) {
	data[getTimeIndex(start)] = make_pair(tick, true);
}

QDateTime OHLCMemoryProvider::getMinimum() {
	return minimum;
}

QDateTime OHLCMemoryProvider::getMaximum() {
	return maximum;
}

int OHLCMemoryProvider::getQuantumSeconds() {
	return quantumSeconds;
}

bool OHLCMemoryProvider::tryGetData(QDateTime start, OHLC& output) {
	pair<OHLC, bool> tick = data[getTimeIndex(start)];
	output = tick.first;
	return tick.second;
}