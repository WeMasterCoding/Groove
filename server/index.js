import express from 'express';
import {createServer} from 'http';
import { Server } from 'socket.io';
import cors from 'cors';

const app = express();
const httpServer = createServer(app)

const port = 8000;

app.use(cors());
app.use(express.json());

const io = new Server(httpServer);

io.on('connection', (socket=>{
    console.log('from backedn-> connected socketio', socket.id);
    socket.on('test', data=>console.log("/test ", data))
    console.log('all rooms: ', io.sockets.adapter.rooms);

    // create room and join
    socket.on('createRoomClick', ({roomID, callbackEvent})=>{
        // console.log('roomd id->', roomID);
        // console.log('callbackeevent', callbackEvent);
        if(io.sockets.adapter.rooms.has(roomID)){
            socket.emit('error', "this roomID already exists, can't create room!");
            socket.emit(callbackEvent, {status: false})

            console.log('room already exists!!');
            return;
        }
        socket.join(roomID);
        console.log('Room created: ', roomID);
        socket.emit(callbackEvent, {status: true})
    })

    // join room
    socket.on('joinRoom', ({roomID, callbackEvent})=>{
        console.log(roomID, callbackEvent)

        if(io.sockets.adapter.rooms.has(roomID)){
            socket.join(roomID);
            console.log('Room joined ', roomID);
            socket.emit(callbackEvent, {status: true})
            console.log(io.sockets.adapter.rooms);

        }else{
            // socket.emit('error', 'invalid room id');
            console.log('invalid room id');
            socket.emit(callbackEvent, {status:false});

        }
    })  

    // leaving room
    socket.on('leaveRoom', (roomID)=>{
        socket.leave(roomID);
        console.log(io.sockets.adapter.rooms);
    })

    // logging all rooms
    socket.on('checkRooms', ()=>{
        console.log(io.sockets.adapter.rooms)
    })
    
    // play-video
    socket.on('play-video', ({videoURL, roomID})=>{
        console.log('videoUrl is-> ', videoURL);
        console.log('roomID is-> ', roomID);

        io.to(roomID).emit('r-video', videoURL);
        
    })

    //chat check
    socket.on('msg-send', (data)=>{
        console.log('msg is-> ', data.msg);
        console.log('room id is-> ', data.roomID);

        io.to(data.roomID).emit('r-msg', data.msg);
    }) 
}))

httpServer.listen(port, '0.0.0.0',()=>{
    console.log('server has started at ', port);
})