const allImgs = document.querySelectorAll("article img[alt]");

function altButton() {
	allImgs.forEach((im) => {
		const det = document.createElement("details");
		const sum = document.createElement("summary");
		det.classList.add("alt-det");
		sum.classList.add("alt-sum");
		sum.textContent = "alt text";
		det.textContent = im.getAttribute("alt");
		det.appendChild(sum);
		im.insertAdjacentElement("afterend", det);
	})
}

altButton();
