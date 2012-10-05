# Twitsort #

## Descripción ##

Aplicación Sinatra que interactúa con las gemas *twitter 3.7.0* y *mongo 1.7.0*, que permite realizar una *búsqueda por determinado hashtag* '#' dentro de los tweets de los usuarios, para luego, tomando en cuenta los tweets que coincidan con el criterio ingresado, *mostrar de manera aleatoria el nombre de un usuario* y darlo como ganador del sorteo.
De manera adicional, estos sorteos se almacenarán en una base de datos *NoSQL*, para poder ser consultados, tentativamente a través de reportes usando la gema *ruports 1.6.3*.

## Colaboradores ##

Fiorella Flores Valdivieso (@giitoF)
Krysthiam Díaz Ayasta (@krykryD)

## Arquitectura ##

La aplicación utiliza como framework Web Sinatra, y los layouts y diagramación de las vistas han sido creadas utilizando el framework Twitter Bootstrap.
Para la elaboración de los Features identificados para la aplicación se han utilizado las gemas:
- sinatra 1.3.3
- sinatra-reloader 1.0.0
- twitter 3.7.0
- cucumber 1.2.0
- mongo 1.7.0
- ruports 1.6.3 (*)


## User Stories Implementadas ##

__User Story 001__
> Como usuario, quiero que la aplicación realice una búsqueda tomando como base el criterio que he ingresado.

__User Story 002__
> Como usuario, quiero que la aplicación valide que debo ingresar un criterio de búsqueda para poder ejecutarla.

__User Story 003__
> Como usuario, quiero que la aplicación permita visualizar los Tweets que coincidan con el criterio de búsqueda ingresado.

__User Story 004__
> Como usuario, quiero que la aplicación realice un sorteo entre los usuarios que hayan escrito Tweets que coincidan con el criterio de búsqueda ingresado y muestre al ganador.