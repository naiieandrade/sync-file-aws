async function listFiles() {
  try {
    const url = "http://localhost:5000/files";
    const response = await fetch(url, { method: "GET" });
    const files = await response.json();
    return files;
  } catch (error) {
    console.error("Error fetching files:", error);
    return [];
  }
}
