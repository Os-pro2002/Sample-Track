
        function setCurrentDateTime() {
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0'); 
            const day = String(now.getDate()).padStart(2, '0');
            const hours = String(now.getHours()).padStart(2, '0'); 
            const minutes = String(now.getMinutes()).padStart(2, '0'); 

            const currentDateTime = `${year}-${month}-${day}T${hours}:${minutes}`;
            
            document.getElementById('received_datetime').value = currentDateTime;
        }

        window.onload = setCurrentDateTime;


        function updateSelectColor(selectElement) {
        if (selectElement.value) {
            selectElement.classList.add('selected');
        } else {
            selectElement.classList.remove('selected');
        }
    }

    document.querySelectorAll('select').forEach(select => {
        select.addEventListener('change', function() {
            updateSelectColor(this);
        });
    });
