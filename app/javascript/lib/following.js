import Rails from '@rails/ujs';

const followUser = userId => {
  let formData = new FormData();
  formData.append('user_id_to_follow', userId);
  Rails.ajax({
    url: '/followings',
    type: 'POST',
    data: formData,
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
    evt.stopPropagation();
  });
});
