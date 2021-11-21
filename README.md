# **RENPES**
## **Registro Educativo de Notas y Pagos Escolares**

Orientado a centros educativos cuyo presupuesto no alcanza para contratar servicios de notas virtuales, o desean implementar un sistema de notas virtual Web para su institución. Desarrollado en Python Flask y orientado a la implementación en arquitectura web
 >Libre no significa Gratis - Richard Stallman

## Requisitos Mínimos De Software **(Usuario y Servicio)**
1. [Python 3.8](https://www.python.org/downloads/)  o superior.
2. Windows 8.1 o Superior, Ubuntu 20.04 LTS o derivados.   _(No se recomienda trabajar con Windows 7 debido a que el Sistema operativo dejó de tener soporte el [14 de Enero de 2020](https://www.microsoft.com/es-ar/windows/windows-7-end-of-life-support-information)), No se ha probado en otras distribuciones derivadas de Linux, sin embargo cualquier S.O. con acceso a Internet y que cumpla los requisitos de Python, PDF e impresión debería funcionar. Cualquier problema acceder a la sección de issues_
3. Software para Lectura de PDF ([Adobe Reader](https://get.adobe.com/es/reader/) o similar)
4. Controladores de impresión _(CUPS en Linux, Los controladores del fabricante de la impresora)_
5. Navegador Web (Firefox, Chrome o derivados de Chromium) **No compatible con Internet Explorer**

## Requisitos de Hardware **(Usuario)**
1. Una computadora o dispositivo móvil con acceso a internet
2. Impresora (Para el área de secretaría o dirección) para imprimir contratos, solvencias de pago, recibos y notas.

## Requisitos para el Servicio
**Se puede utilizar el servicio principalmente de dos maneras:**
### **Como servicio Web:**
Contratando un servicio de hosting y asignándole a este un dominio o bien, utilizando el servicio gratuito que proveen algunos. _(Debe tener en cuenta que muchos servicios de hosting gratuito únicamente ofrecen el servicio por un tiempo límite que puede variar entre 1 y 3 meses, por lo que considere usarlo con una cuenta de pago)_ Con este servicio el personal de la institución tendrá acceso a los datos del centro educativo desde cualquier sitio y en cualquier momento, siempre que cuenten con acceso a internet.
### **Como un sistema interno o Local:**
Configurando una Computadora como servidor, la cual debe montar el servicio y actuará como un sitio web Interno (En la red local) al cual accederán únicamente mediante la IP en el navegador. 

**ATENCIÓN:** configurado el sistema de esta forma sólo va a funcionar para las computadoras o dispostivos móviles conectados a la red del centro educativo. de esta forma no se podrá acceder a los datos desde fuera del centro educativo, salvo que el encargado de IT configure alguna VPN. _(Debe tener en cuenta que de esta forma, el servicio funcionará unicamente cuando la computadora designada como servidor, esté encendida y conectada a la red, lo que generalmente solo sucede durante el horario laboral del centro educativo, de esta forma también hay que considerar los fallos en el suministro eléctrico o bien, en el servicio de internet proveído por su ISP)_

