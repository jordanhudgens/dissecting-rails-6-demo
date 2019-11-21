import consumer from './consumer';

consumer.subscriptions.create(
  {channel: 'LiveUpdatesChannel', id: 123},
  {
    // Called when the subscription is ready for use on the server.
    connected() {
      const guide = document.querySelector('#guide-show');

      console.log('Connected', guide);
    },

    received(data) {
      console.log('Received update', data);
    },
  },
);
