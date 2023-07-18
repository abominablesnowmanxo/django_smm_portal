// DRAG_N_DROP MONTH CALENDAR

document.addEventListener('DOMContentLoaded', function () {
    const postElements = document.querySelectorAll('.post');
    const cellElements = document.querySelectorAll('.cell');

    let draggedPost; // Variable to store the dragged post element

    // Add event listeners to post elements for drag start and end
    postElements.forEach(post => {
        post.draggable = true;
        post.addEventListener('dragstart', handleDragStart);
        post.addEventListener('dragend', handleDragEnd);
    });

    // Add event listeners to cell elements for drag over, enter, and drop
    cellElements.forEach(cell => {
        cell.addEventListener('dragover', handleDragOver);
        cell.addEventListener('dragenter', handleDragEnter);
        cell.addEventListener('drop', handleDrop);
    });

    // Event listener for drag start
    function handleDragStart(event) {
        draggedPost = event.target; // Store the dragged post element
        event.dataTransfer.setData('text/plain', ''); // Firefox requires data to be set for the drag event to work properly
        event.dataTransfer.effectAllowed = 'move';
        draggedPost.classList.add('dragging');

    }

    // Event listener for drag end
    function handleDragEnd(event) {
        event.preventDefault();
        draggedPost.classList.remove('dragging');
    }

    // Event listeners for drag over and drag enter to allow dropping
    function handleDragOver(event) {
        event.preventDefault();
        event.dataTransfer.dropEffect = 'move';
    }

    function handleDragEnter(event) {
        event.preventDefault();
    }

    // Event listener for drop
    function handleDrop(event) {
        event.preventDefault();

        const dropzone = event.target.closest('.cell');
        if (dropzone) {
            dropzone.appendChild(draggedPost);

            const newDate = dropzone.getAttribute('data-date');

            // Make sure we have a valid date to drop onto
            if (newDate) {
                // Assuming your post element has a data attribute 'data-event-id' containing the event ID
                const eventId = draggedPost.getAttribute('data-event-id');

                // Make an AJAX request to update the event's date in the Django backend
                const updatedEvent = {
                    id: eventId,
                    start: newDate, // Assuming the newDate format is compatible with the model field
                };
                fetch('/update_event_date/', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRFToken': '{{ csrf_token }}', // Add CSRF token if needed
                    },
                    body: JSON.stringify(updatedEvent),
                })
                    .then(response => response.json())
                    .then(data => {
                        // console.log('success')
                        // Handle success or error response if needed
                        // For example, you can update the UI to reflect the new date.
                        // You may need to reload the calendar or update the event manually.
                    })
                    .catch(error => {
                        // Handle error if needed
                        console.error('Error:', error);
                    });
            }
        }
    }
});
