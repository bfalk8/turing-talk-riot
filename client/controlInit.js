import RiotControl from 'riotcontrol';
// bind RiotControl to riot instance
riot.control = RiotControl;

import MessageStore from 'stores/MessageStore.js';
// instantiate the store
var messageStore = new MessageStore();
// register the message store with RiotControl
riot.control.addStore(messageStore);
