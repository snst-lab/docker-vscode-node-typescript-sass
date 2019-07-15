# Try Out Development Containers: Node.js & TypeScript & Redis

This is a sample project that lets you try out the **[VS Code Remote - Containers](https://aka.ms/vscode-remote/containers)** extension in a few easy steps.

> **Note:** If you're following the quick start, you can jump to the [Things to try](#things-to-try) section. 


<br>


## Setting up the development container

Follow these steps to open this sample in a container:

1. If this is your first time using a development container, please follow the [getting started steps](https://aka.ms/vscode-remote/containers/getting-started).

2. If you're not yet in a development container:
   - Clone this repository.
   ```sh
     git clone https://github.com/snst-lab/vscode-remote-try-node-typescript-redis
   ```
   - Run command below to launch container 
   ```sh
     docker-compose up --build
   ```
   - Press <kbd>F1</kbd> and select the **Remote-Containers: Attach to Running Container...** command.
   - Select the cloned copy of this folder, wait for the container to start, and try things out!

<br>

## Operation check of Redis
  After starting the container, you can check the operation of Redis with the following command.
  
   ```sh
    curl -X POST http://localhost:3000/api
   ```
If it works properly, you have the following response.
   ```sh
    POST request received. Number of Visits: [Times of POST Request]
   ```

<br>

## Base Docker Image
  This tryout uses Minimum Ubuntu from the following repository 
> https://github.com/tianon/docker-brew-ubuntu-core/blob/59aa7dfef17153ecc812adbf26516675ce67e8aa/bionic/Dockerfile

There is 'alpine linux' as a representative of the small image.
But, I took an alternative since 'Remote Development' does not support 'alpine linux'.

<br>

## Things to try

One you have this sample opened in a container, you'll be able to work with it like you would locally.

Some things to try:

1. **Edit:**
   - Open `build/server/main.ts`
   - Try adding some code and check out the language features. Notice that `tslint` and the `eg2.tslint` extension are already installed in the container.
2. **Terminal:** Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>\`</kbd> and type `uname` and other Linux commands from the terminal window.
3. **Build, Run, and Debug:**
   - Build with command below 
   - Add a breakpoint (e.g. on line 20).
   - Press <kbd>F5</kbd> to launch the app in the container.
   - Once the breakpoint is hit, try hovering over variables, examining locals, and more.
   - Continue, then open a local browser and go to `http://localhost:3000` and note you can connect to the server in the container.
4. **Forward another port:**
   - Stop debugging and remove the breakpoint.
   - Open `server.js`
   - Change the server port to 5000. (`const PORT = 5000;`)
   - Press <kbd>F5</kbd> to launch the app in the container.
   - Press <kbd>F1</kbd> and run the **Remote-Containers: Forward Port from Container...** command.
   - Select port 5000.
   - Click "Open Browser" in the notification that appears to access the web app on this new port.

5. **Build with webpack**
   - After editing  `build/server/**.ts`, build it with command below using webpack. 
   ```sh
     webpack
   ```
   - Notice that if you have not done `npm install`, please execute first.



## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.



## License

Copyright © Microsoft Corporation All rights reserved.<br />
Licensed under the MIT License. See LICENSE in the project root for license information.
