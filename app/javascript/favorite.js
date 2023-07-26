
window.addEventListener('load',()=>{
  const favoriteBtn = document.getElementById('favorite-btn')
  const favoriteNum = document.getElementById('favorite-num')
  const favoriteText = document.getElementById('favorite-text')
  favoriteBtn.addEventListener('click',(e)=>{
    e.preventDefault();
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/favorites", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`エラーが発生したため処理を中断しました`);
        return;
      };
      favoriteNum.textContent = XHR.response.favoriteCount
      favoriteText.textContent = XHR.response.deleted ? 'お気に入り登録' : 'お気に入り解除';
      alert(XHR.response.message)
    };
  })
})
