import consumer from './consumer';

consumer.subscriptions.create('LiveUpdatesChannel', {
  // Called when the subscription is ready for use on the server.
  connected() {
    console.log('Connected');
  },

  // Called when the WebSocket connection is closed.
  disconnected() {
    console.log('Disconnected');
  },

  received(data) {
    console.log('Received update', data);
  },
});
