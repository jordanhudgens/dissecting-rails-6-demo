document.addEventListener('turbolinks:load', function() {
  const followBtn = document.querySelector('.follow-btn');

  if (followBtn) {
    followBtn.addEventListener(
      'click',
      function() {
        alert('Following...');
      },
      false,
    );
  }
});
