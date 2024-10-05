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
        await exec('yt-dlp', {
            output: `${downloadPath}/%(title)s.%(ext)s`, // Output path for downloaded files
            args: [videoUrl] // Pass the video URL
        });

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
