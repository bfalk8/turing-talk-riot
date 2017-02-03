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
    console.log(msg);
    let newMsg = {
      encodedMessage: msg,
      decodedMessage: msg,
      timestamp: new Date().toString()
    };
    this.messages.push(newMsg);
    riot.control.trigger('message.new', this.messages);
  }

}
