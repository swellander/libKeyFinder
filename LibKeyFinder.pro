#*************************************************************************
#
# Copyright 2011-2013 Ibrahim Sha'ath
#
# This file is part of LibKeyFinder.
#
# LibKeyFinder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# LibKeyFinder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with LibKeyFinder.  If not, see <http://www.gnu.org/licenses/>.
#
#*************************************************************************

QT -= gui
CONFIG -= qt

TARGET = keyfinder
TEMPLATE = lib

VERSION = 0.2.2

DEFINES += LIBKEYFINDER_LIBRARY

HEADERS += \
    keyfinder.h \
    chromagram.h \
    windowfunctions.h \
    toneprofiles.h \
    spectrumanalyser.h \
    parameters.h \
    exception.h \
    seg.h \
    keyclassifier.h \
    segcosine.h \
    segnone.h \
    segarbitrary.h \
    keyfinderresult.h \
    audiodata.h \
    lowpassfilterfactory.h \
    lowpassfilter.h \
    downsampler.h \
    binode.h \
    constants.h \
    chromatransform.h \
    chromatransformfactory.h \
    fftadapter.h

SOURCES += \
    keyfinder.cpp \
    chromagram.cpp \
    windowfunctions.cpp \
    toneprofiles.cpp \
    spectrumanalyser.cpp \
    parameters.cpp \
    keyclassifier.cpp \
    seg.cpp \
    segcosine.cpp \
    segnone.cpp \
    segarbitrary.cpp \
    audiodata.cpp \
    lowpassfilterfactory.cpp \
    lowpassfilter.cpp \
    downsampler.cpp \
    chromatransform.cpp \
    chromatransformfactory.cpp \
    fftadapter.cpp

OTHER_FILES += README

unix|macx{
  LIBS += -lfftw3
}

macx{
  DEPENDPATH += /usr/local/lib
  INCLUDEPATH += /usr/local/include
  CONFIG -= ppc ppc64
  CONFIG += x86 x86_64
# installs
  QMAKE_LFLAGS_SONAME  = -Wl,-install_name,/usr/local/lib/
  headers.path = /usr/local/include/$$TARGET
  headers.files = $$HEADERS
  INSTALLS += headers
}

win32{
#  INCLUDEPATH += C:/MSYS/local/include
#  DEPENDPATH += C:/MSYS/local/bin
#  LIBS += -LC:/MSYS/local/bin
#  LIBS += -lfftw3-3
  INCLUDEPATH += C:/MinGW/msys/1.0/local/include
  DEPENDPATH += C:/MinGW/msys/1.0/local/bin
  LIBS += -LC:/MinGW/msys/1.0/local/bin
  LIBS += -LC:/MinGW/msys/1.0/local/lib
  LIBS += -lfftw3-3 -lboost_system-47-mt-1_52 -lboost_thread-47-mt-1_52
}

# the rest auto generated by Qt Creator...

symbian {
    MMP_RULES += EXPORTUNFROZEN
    TARGET.UID3 = 0xE1558240
    TARGET.CAPABILITY =
    TARGET.EPOCALLOWDLLDATA = 1
    addFiles.sources = LibKeyFinder.dll
    addFiles.path = !:/sys/bin
    DEPLOYMENT += addFiles
}

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/local/lib
    }
    INSTALLS += target
}
