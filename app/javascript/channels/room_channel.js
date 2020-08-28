import consumer from "./consumer"
  const chatChannel = consumer.subscriptions.create("RoomChannel", {

  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data['user_id'] == $('#user_room').data('user_id')) {
      $('#messageBox').append('<p id="new-message">'+data['message']+'</p>');
    } else {
      $('#messageBox').append('<p id="new-message">'+data['message']+'</p>');
    }
  },

  speak: function(message) {
    const user_room = $('#user_room').data()
    return this.perform('create', {
      message: message,
      user_room: user_room
    });
  }

});

$(document).on('keypress', '#message-form', function(e) {
  if (e.keyCode === 13 && e.target.value !== "") {
    chatChannel.speak(e.target.value);
    e.target.value = '';
    return e.preventDefault();
  }
})