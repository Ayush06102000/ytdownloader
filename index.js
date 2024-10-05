const express = require('express');
const { exec } = require('yt-dlp-exec');
const app = express();
const PORT = process.env.PORT || 3000;

// Create the downloads directory if it doesn't exist
const downloadPath = '/app/downloads';

app.get('/download', async (req, res) => {
    const videoUrl = req.query.url; // Assuming you're passing the URL as a query parameter

    if (!videoUrl) {
        return res.status(400).send('Video URL is required.');
    }

    try {
        // Execute yt-dlp command to download the video
        await exec(`yt-dlp -o "${downloadPath}/%(title)s.%(ext)s" "${videoUrl}"`);

        res.send('Video downloaded successfully.');
    } catch (error) {
        console.error('Error downloading video:', error);
        res.status(500).send('Error downloading video.');
    }
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
