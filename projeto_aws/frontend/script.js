function uploadFile() {
    const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];
    if (file) {
      const formData = new FormData();
      formData.append('file', file);
  
      fetch('http://localhost:5000/upload', {
        method: 'POST',
        body: formData
      })
      .then(response => {
        console.log(response);
        alert('File uploaded successfully!');
      })
      .catch(error => {
        console.error('Error uploading file:', error);
        alert('Error uploading file. Check the console for more details.');
      });
    } else {
      alert('Select a file to upload.');
    }
  }
