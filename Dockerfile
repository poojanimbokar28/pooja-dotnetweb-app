FROM redhat/ubi8  
# we are using redhat 8 image from docker hub
# if this image is not available in docker server it will pull it
RUN dnf install dotnet-sdk-8.0 -y  
RUN mkdir /pooja-app 
# uses to run any command during docker build time
COPY . /pooja-app/
# we are copying code from folder to inside docker image
WORKDIR /pooja-app
RUN dotnet build -o poojabin
RUN dotnet publish -o pooja_publish -p:AssemblyName=poojadotnet
CMD ./pooja_publish/poojadotnet --urls=http://0.0.0.0:5000
# must be the final keyword of dockerfile which will run your app
