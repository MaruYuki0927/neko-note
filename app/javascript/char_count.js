document.addEventListener("turbo:load", () => {
  const textarea = document.getElementById("post_body");
  const counter = document.getElementById("char-count");

  if (!textarea || !counter) return;

  const updateCount = () => {
    counter.textContent = `${textarea.value.length}文字`;
  };

  textarea.addEventListener("input", updateCount);

  updateCount();
});