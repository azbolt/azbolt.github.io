function handleFormSubmit(event) {
  event.preventDefault();
  document.getElementById('contact-form').style.display = 'none';
  document.getElementById('thankyou_message').style.display = 'block';
  gtag('event', 'generate_lead', { 'event_category': 'engagement' });
}

function loaded() {
  var form = document.getElementById("upstack-v1-form");
  form.addEventListener("submit", handleFormSubmit, false);
};

document.addEventListener('DOMContentLoaded', loaded, false);
