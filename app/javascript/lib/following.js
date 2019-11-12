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
  const followBtn = document.querySelector('.follow-btn');
  const userId = followBtn.dataset.userId;

  if (followBtn) {
    followBtn.addEventListener(
      'click',
      function() {
        followUser(userId);
      },
      false,
    );
  }
});
