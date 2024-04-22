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
      .then(response => response.text())
      .then(data => {
        console.log(data);
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
  
// // Seleciona os elementos do DOM
// const fileInput = document.getElementById('fileInput');
// const uploadButton = document.getElementById('uploadButton');

// // Adiciona um ouvinte de evento para o botão de upload
// uploadButton.addEventListener('click', () => {
//     const file = fileInput.files[0];
//     if (file) {
//         uploadFile(file);
//     } else {
//         alert('Selecione um arquivo para fazer o upload.');
//     }
// });

// // Função para fazer o upload do arquivo
// function uploadFile(file) {
//     const formData = new FormData();
//     formData.append('file', file);

//     fetch('http://localhost:5000/upload', {
//         method: 'POST',
//         body: formData
//     })
//     .then(response => response.text())
//     .then(data => {
//         console.log(data);
//         alert('Arquivo enviado com sucesso!');
//     })
//     .catch(error => {
//         console.error('Erro ao enviar arquivo:', error);
//         alert('Erro ao enviar arquivo. Verifique o console para mais detalhes.');
//     });
// }
