<h1 align="center">
  <a href="https://qvo.cl">
    <img src="https://cdn.rawgit.com/qvo-team/qvo-node-express-examples/master/sticker.png" alt="QVO Developers" width="200">
  </a>
  <br>
  Ejemplos QVO Ruby on Rails
  <br>
  <br>
</h1>


Este repositorio contiene una aplicación Ruby on Rails con ejemplos de funcionalidades de la [API QVO](https://docs.qvo.cl).

Los ejemplos incluidos son:

- **Cobrar a tarjeta**: Se muestra de manera simple la funcionalidad de un cobro puntual a tarjetas de débito o crédito mediante Webpay Plus.
- **Planes y suscripciones**: Se muestra de manera simple la funcionalidad de planes y suscripciones mediante un formulario selección de planes. Se asume que el cliente no existe y se registra en la plataforma eligiendo un plan. Se crearon previamente los planes en el sistema.
- **Botón de pago y Checkout**: Se muestra de manera simple la funcionalidad del botón de pago para un producto puntual.

La aplicación viene previamente configurada con credenciales para realizar pruebas de inmediato, pero puedes cambiarlas por tus propias credenciales en el archivo modificando la constante API_TOKEN de cada controlador.

> **OJO 👀:** Si utilizas las credenciales de tu cuenta y estas probando suscripciones, debes reemplazar los planes (PLANS) usados en SubscriptionController por los planes de tu cuenta.

Para realizar pagos de prueba utiliza las credenciales provistas en [nuestra documentación](https://docs.qvo.cl/#pruebas-y-sandbox).

## Documentación

 - [Referencia API QVO](https://docs.qvo.cl)
 - [Guía Desarrolladores](https://qvo.cl/guia/hola-mundo/)

## Requisitos

- [Git](https://www.atlassian.com/git/tutorials/install-git)
- [Ruby on Rails] (https://gorails.com/setup)

## Gema importante
Para los ejemplos se usa la Gema `http_party`. Puedes encontrar información sobre su uso en
[https://github.com/jnunemaker/httparty](https://github.com/jnunemaker/httparty)

## Instalación

```bash
git clone git@github.com:qvo-team/qvo-ruby-on-rails-examples.git
cd qvo-ruby-on-rails-examples
bundle install
```

## Ejecución

```bash
rails server
```

Ahora dirígete en tu navegador a `http://localhost:3000`
