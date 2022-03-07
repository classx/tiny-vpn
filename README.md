# tiny-vpn - OpenVPN for Docker
self hosted vpn server

the original project - [umputun/dockvpn](https://github.com/umputun/dockvpn) and it has its own automatic build on dockerhub.

### Quick instructions:

#### Run openvpn server
```
CID=$(docker run -d --privileged -p 1194:1194/udp -p 443:443/tcp classx/tiny-vpn)
```
#### Get client config ovpn file 
```
docker run -t -i -p 8080:8080 --volumes-from $CID umputun/dockvpn serveconfig
```
Now download the file located at the indicated URL. You will get a certificate warning, since the connection is done over SSL, but we are using a self-signed certificate. After downloading the configuration, stop the serveconfig container. You can restart it later if you need to re-download the configuration, or to download it to multiple devices.

The file can be used immediately as an OpenVPN profile. It embeds all the required configuration and credentials. It has been tested successfully on Linux, Windows, and Android clients. If you can test it on OS X and iPhone, let me know!
