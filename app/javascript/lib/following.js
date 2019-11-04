import Rails from '@rails/ujs';

const followUser = () => {
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

  if (followBtn) {
    followBtn.addEventListener(
      'click',
      function() {
        followUser();
      },
      false,
    );
  }
});
