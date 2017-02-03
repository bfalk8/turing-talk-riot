// create a store for messaging
// export default function MessageStore() {
//   var messages = [];
//   riot.observable(this);

// }


export default class MessageStore {
  constructor() {
    riot.observable(this);
    this.messages = [];
    this.on('message.received', this.newMessage.bind(this));
  }

  newMessage(msg) {
    this.messages.push(msg);
    this.trigger('message.new', this.messages);
  }

}
