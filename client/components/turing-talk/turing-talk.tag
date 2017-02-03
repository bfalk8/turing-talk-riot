import style from './turing-talk.css';
import SocketHandler from 'SocketHandler';
import 'components/chat/chat.tag';

<turing-talk>
  <h1>Turing Talk!</h1>
  <chat />

  <script>
    this.style = style;
    this.on('mount', () => {
      this.socket = new SocketHandler();
    });
  </script>
</turing-talk>
