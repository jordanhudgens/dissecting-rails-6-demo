import Rails from '@rails/ujs';

const followUser = userId => {
  console.log('PASSED IN USER ID', userId);
  Rails.ajax({
    url: '/followings',
    type: 'POST',
    success: function(data) {
      console.log('FOLLOWINGS', data);
    },
  });
};

document.addEventListener('turbolinks:load', function() {
  // Event delegation
  document.addEventListener('click', function(evt) {
    if (!evt.target.matches('.follow-btn')) return;
    followUser(evt.target.dataset.userId);
    evt.preventDefault();
  });
});
