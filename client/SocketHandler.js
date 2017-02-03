import io from 'socket.io-client';

export default class SocketHandler {
  constructor() {
    this.socket = io();
    this.socket.on('init', (data) => console.log(data));
    this.socket.on('chat message', (data) => {
      riot.control.trigger('message.received', data);
    });
    riot.control.on('message.send', (msg) => {
      this.socket.emit('chat message', msg);
    });
  }
}
