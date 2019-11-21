import consumer from './consumer';

document.addEventListener('turbolinks:load', function() {
  const guide = document.querySelector('#guide-show');

  if (guide) {
    var guideId = guide.dataset.guideId;

    consumer.subscriptions.create(
      {channel: 'LiveUpdatesChannel', id: guideId},
      {
        connected() {
          console.log('Connected');
        },

        received(data) {
          console.log('Received update', data.body);
          guide.innerHTML = data.body;
        },
      },
    );
  }
});
