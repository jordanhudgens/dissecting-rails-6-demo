import consumer from './consumer';

document.addEventListener('turbolinks:load', function() {
  const guide = document.querySelector('#guide-show');

  if (guide) {
    var guideId = guide.dataset.guideId;
    console.log('guide id outside', guideId);

    consumer.subscriptions.create(
      {channel: 'LiveUpdatesChannel', id: guideId},
      {
        // Called when the subscription is ready for use on the server.
        connected() {
          // console.log('Connected', guideId);
        },

        received(data) {
          console.log('Received update', data);
        },
      },
    );
  }
});
