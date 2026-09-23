document.addEventListener("DOMContentLoaded", function () {
    const toast = document.getElementById("toastMessage");
    const compareBar = document.getElementById("compareBar");
    const compareCount = document.getElementById("compareCount");
    const compareChecks = Array.from(document.querySelectorAll(".compare-check"));

    function showToast(message) {
        if (!toast) return;
        toast.textContent = message;
        toast.classList.add("is-visible");
        window.setTimeout(() => toast.classList.remove("is-visible"), 2600);
    }

    function getCompared() {
        try {
            return JSON.parse(window.localStorage.getItem("electronicsCompare") || "[]");
        } catch (error) {
            return [];
        }
    }

    function setCompared(items) {
        window.localStorage.setItem("electronicsCompare", JSON.stringify(items.slice(0, 3)));
    }

    function renderCompareBar() {
        const items = getCompared();
        if (compareCount) compareCount.textContent = items.length;
        if (compareBar) compareBar.classList.toggle("is-visible", items.length > 0);
    }

    compareChecks.forEach(function (checkbox) {
        const id = checkbox.value;
        checkbox.checked = getCompared().some(item => item.id === id);
        checkbox.addEventListener("change", function () {
            let items = getCompared().filter(item => item.id !== id);
            if (checkbox.checked) {
                if (items.length >= 3) {
                    checkbox.checked = false;
                    showToast("Compare up to 3 products at a time.");
                    return;
                }
                items.push({
                    id: id,
                    name: checkbox.dataset.name || "Product"
                });
                showToast(checkbox.dataset.name + " added to compare.");
            }
            setCompared(items);
            renderCompareBar();
        });
    });

    const compareButton = document.getElementById("openCompare");
    if (compareButton) {
        compareButton.addEventListener("click", function () {
            const items = getCompared();
            if (items.length < 2) {
                showToast("Select at least two products to compare.");
                return;
            }
            window.location.href = "/compare?ids=" + items.map(item => item.id).join(",");
        });
    }

    const searchInput = document.getElementById("productSearch");
    if (searchInput) {
        searchInput.addEventListener("input", function () {
            const query = searchInput.value.toLowerCase().trim();
            document.querySelectorAll(".product-col").forEach(function (card) {
                const searchable = card.dataset.search || "";
                card.style.display = searchable.includes(query) ? "" : "none";
            });
        });
    }

    document.querySelectorAll("[data-ripple]").forEach(function (button) {
        button.addEventListener("click", function () {
            button.classList.add("active");
            window.setTimeout(() => button.classList.remove("active"), 180);
        });
    });

    document.querySelectorAll("img").forEach(function (image) {
        image.addEventListener("error", function () {
            image.style.display = "none";
        });
    });

    renderCompareBar();
});