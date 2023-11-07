import consumer from "./consumer"
import $ from 'jquery';

$(function(){
	const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room_id: $('#messages').data('room_id') }, {
		connected() {
		},

		disconnected() {
			// Called when the subscription has been terminated by the server
		},

		received(data) {
			const messagesContainer = $('#messages');
			messagesContainer.prepend(data['message']);
		},

		speak: function(message) {
			return this.perform('speak', {message: message, room_id: $('#messages').data('room_id')});
		}
	});

	$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
		if (event.key === 'Enter') {
			chatChannel.speak(event.target.value);
			event.target.value = '';
			return event.preventDefault();
		}
	});
});