#/bin/bash


cd service-hello-1 &&
./run.sh stop &&
sleep 2s &&
cd ../service-hello-2 &&
./run.sh stop &&
sleep 2s &&
cd ../service-hi-1 &&
./run.sh stop &&
sleep 2s &&
cd ../service-hi-2 &&
./run.sh stop &&
sleep 2s &&
cd ../service-turbine-1 &&
./run.sh stop &&
sleep 2s &&
cd ../service-turbine-2 &&
./run.sh stop &&
sleep 2s &&
cd ../service-zuul-1 &&
./run.sh stop &&
sleep 2s &&
cd ../service-zuul-2 &&
./run.sh stop &&
sleep 2s &&
cd ../zipkin-server &&
./run.sh stop &&
sleep 2s &&
cd ../config-server-1 &&
./run.sh stop &&
sleep 2s &&
cd ../config-server-2 &&
./run.sh stop &&
sleep 10s &&
cd ../eureka-server-1 &&
./run.sh stop &&
sleep 2s &&
cd ../eureka-server-2 &&
./run.sh stop &&
sleep 10s;