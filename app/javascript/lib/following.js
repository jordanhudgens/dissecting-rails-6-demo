import Rails from '@rails/ujs';

const followUser = (userId, el) => {
  let formData = new FormData();
  formData.append('user_id_to_follow', userId);
  Rails.ajax({
    url: '/followings',
    type: 'POST',
    data: formData,
    success: function(data) {
      // SET CLASS
      el.innerText = 'Following';
    },
  });
};

const unfollowUser = (userId, el) => {
  Rails.ajax({
    url: `/followings/${userId}`,
    type: 'DELETE',
    success: function(data) {
      // SET CLASS
      el.innerText = 'Follow';
    },
  });
};

document.addEventListener('turbolinks:load', function() {
  // Event delegation
  document.addEventListener('click', function(evt) {
    if (evt.target.matches('.follow-btn')) {
      const userId = evt.target.dataset.userId;
      followUser(userId, evt.target);
    }

    if (evt.target.matches('.following-btn')) {
      const userId = evt.target.dataset.userId;
      unfollowUser(userId, evt.target);
    }

    evt.stopPropagation();
  });
});
