Description
----

<a target="_blank" href="https://github.com/Microsoft/BotFramework-Emulator">Microsoft bot framework</a> running inside docker. This will allow you to run the emulator in the same network as your actual
application.

Usage
----

1. Checkout the project
```bash
git clone https://github.com/MartinAnt/botframework-emulator-dockerized.git ~/botframework-emulator-dockerized
```

2. Build the image

```bash
docker build -t botbuilder-emulator ~/botframework-emulator-dockerized
```

3. Run the container
```bash
docker run -it --network container:my_container_1 --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix botbuilder-emulator
```

Where the my_container_1 is the container where your bot is running.

Now you can assume that your app server is running somewhere on localhost with your bot.