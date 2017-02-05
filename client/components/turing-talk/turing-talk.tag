import style from './turing-talk.css';
import MessageStore from 'stores/MessageStore';
import 'components/chat/chat.tag';
import 'components/enigma-settings/enigma-settings.tag';

<turing-talk>
  <h1 class={style.title}>Turing Talk!</h1>
  <chat style='height: 90%'/>
  <enigma-settings />

  <script>
    this.style = style;

    this.on('mount', () => {
      riot.control.addStore(new MessageStore());
    });
  </script>
</turing-talk>
