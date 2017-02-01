import style from './message.css';

<message class={style.root}>
  <div class={style.messageEncoded}>
    <p class={style.message}>{opts.encodedmessage}</p>
    <p class={style.timestamp}>{opts.timestamp}</p>
  </div>
  <div class={style.messageDecoded}>
    <p class={style.message}>{opts.decodedmessage}</p>
  </div>

  <script>
    this.style = style;
  </script>
</message>
