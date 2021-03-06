CONFIG += debug c++11

HEADERS += mainwindow.h view.h candle.h grid.h
HEADERS += ohlc.h
HEADERS += ohlc_random_generator.h ohlc_shrinker.h ohlc_provider.h ohlc_memory_provider.h
HEADERS += data_loader.h yahoo_loader.h yahoo_csv_loader.h csv_reader.h
HEADERS += graph_event_controller.h
HEADERS += grid_labeler.h
HEADERS += x_axis_labeler.h x_axis_year_labeler.h x_axis_month_labeler.h x_axis_day_labeler.h
HEADERS += candlestick_interval.h graph_viewport.h
HEADERS += graph_overlay.h candlesticks_overlay.h
HEADERS += bollinger_overlay.h bollinger_calculator.h
HEADERS += rsi_overlay.h rsi_calculator.h macd_overlay.h macd_calculator.h ema_calculator.h
HEADERS += abstract_graph_view.h graph_view.h rsi_graph_view.h macd_graph_view.h

HEADERS += axis_pair.h time_axis.h time_range.h number_axis.h number_range.h

SOURCES += main.cpp
SOURCES += mainwindow.cpp view.cpp candle.cpp grid.cpp
SOURCES += ohlc.cpp
SOURCES += ohlc_random_generator.cpp ohlc_shrinker.cpp ohlc_memory_provider.cpp ohlc_provider.cpp
SOURCES += yahoo_loader.cpp yahoo_csv_loader.cpp csv_reader.cpp
SOURCES += graph_event_controller.cpp
SOURCES += grid_labeler.cpp
SOURCES += x_axis_year_labeler.cpp x_axis_month_labeler.cpp x_axis_day_labeler.cpp
SOURCES += candlestick_interval.cpp graph_viewport.cpp
SOURCES += candlesticks_overlay.cpp
SOURCES += bollinger_overlay.cpp bollinger_calculator.cpp
SOURCES += rsi_overlay.cpp rsi_calculator.cpp macd_overlay.cpp macd_calculator.cpp ema_calculator.cpp
SOURCES += abstract_graph_view.cpp graph_view.cpp rsi_graph_view.cpp macd_graph_view.cpp

SOURCES += axis_pair.cpp time_axis.cpp number_axis.cpp

QT += widgets xml network
qtHaveModule(printsupport): QT += printsupport
qtHaveModule(opengl): QT += opengl

build_all:!build_pass {
    CONFIG -= build_all
    CONFIG += release
}
