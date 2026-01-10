const allImgs = document.querySelectorAll("img[alt]");

function altButton() {
	allImgs.forEach((im) => {
		const det = document.createElement("details");
		const sum = document.createElement("summary");
		sum.textContent = "alt text";
		det.appendChild(sum);
		det.textContent = im.getAttribute("alt");
		im.insertAdjacentElement("afterend", det);
	})
}

altButton();
