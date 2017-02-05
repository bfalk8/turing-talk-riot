import io from 'socket.io-client';

export default class SocketHandler {
  constructor(messageHandler) {
    this.socket = io();
    this.socket.on('init', (data) => console.log(data));
    this.socket.on('chat message', messageHandler);
    this.sendMessage = this.sendMessage.bind(this);
  }

  sendMessage(msg) {
    this.socket.emit('chat message', msg);
  }
}
