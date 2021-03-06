#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

CXX = c++
CXXFLAGS = -pthread -std=c++0x -march=native
OBJS = args.o dictionary.o productquantizer.o matrix.o qmatrix.o vector.o model.o utils.o fasttext.o losslayer.o loss_plt.o loss_ensemble.o kmeans.o loss_sigmoid.o
INCLUDES = -I.

opt: CXXFLAGS += -O3 -funroll-loops
opt: extremetext

debug: CXXFLAGS += -g -O0 -fno-inline
debug: extremetext

args.o: src/args.cc src/args.h
	$(CXX) $(CXXFLAGS) -c src/args.cc

dictionary.o: src/dictionary.cc src/dictionary.h src/args.h
	$(CXX) $(CXXFLAGS) -c src/dictionary.cc

productquantizer.o: src/productquantizer.cc src/productquantizer.h src/utils.h
	$(CXX) $(CXXFLAGS) -c src/productquantizer.cc

matrix.o: src/matrix.cc src/matrix.h src/utils.h
	$(CXX) $(CXXFLAGS) -c src/matrix.cc

qmatrix.o: src/qmatrix.cc src/qmatrix.h src/utils.h
	$(CXX) $(CXXFLAGS) -c src/qmatrix.cc

vector.o: src/vector.cc src/vector.h src/utils.h
	$(CXX) $(CXXFLAGS) -c src/vector.cc

model.o: src/model.cc src/model.h src/args.h
	$(CXX) $(CXXFLAGS) -c src/model.cc

utils.o: src/utils.cc src/utils.h
	$(CXX) $(CXXFLAGS) -c src/utils.cc

losslayer.o: src/losslayer.cc src/losslayer.h
	$(CXX) $(CXXFLAGS) -c src/losslayer.cc

loss_plt.o: src/loss_plt.cc src/loss_plt.h
	$(CXX) $(CXXFLAGS) -c src/loss_plt.cc

loss_ensemble.o: src/loss_ensemble.cc src/loss_ensemble.h
	$(CXX) $(CXXFLAGS) -c src/loss_ensemble.cc

kmeans.o: src/kmeans.cc src/kmeans.h
	$(CXX) $(CXXFLAGS) -c src/kmeans.cc

loss_sigmoid.o: src/loss_sigmoid.cc src/loss_sigmoid.h
	$(CXX) $(CXXFLAGS) -c src/loss_sigmoid.cc

fasttext.o: src/fasttext.cc src/*.h
	$(CXX) $(CXXFLAGS) -c src/fasttext.cc

extremetext: $(OBJS) src/fasttext.cc
	$(CXX) $(CXXFLAGS) $(OBJS) src/main.cc -o extremetext

clean:
	rm -rf *.o extremetext
