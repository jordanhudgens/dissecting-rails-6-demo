import Rails from '@rails/ujs';

const followUser = (userId, el) => {
  let formData = new FormData();
  formData.append('user_id_to_follow', userId);
  Rails.ajax({
    url: '/followings',
    type: 'POST',
    data: formData,
    success: function(data) {
      console.log('FOLLOWINGS', data);
      console.log('target element', el);
    },
  });
};

document.addEventListener('turbolinks:load', function() {
  // Event delegation
  document.addEventListener('click', function(evt) {
    if (!evt.target.matches('.follow-btn')) return;
    const userId = evt.target.dataset.userId;
    followUser(userId, evt.target);
    evt.stopPropagation();
  });
});
