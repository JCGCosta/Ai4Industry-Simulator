import React, { Component } from 'react';
import { Group, Stage, Layer, Rect, Line, Text, Arrow } from 'react-konva';

const HOST = "http://localhost:8080/";
const simu = process.env.REACT_APP_SIMU;

if (!simu || simu === "N") {
  alert("Error: simu number is not set. Please set REACT_APP_SIMU with your group number '1-8' in the .env file)");
  
}

// const HOST = "https://ci.mines-stetienne.fr/simu-backdoor/";
// const HOST = "http://localhost:3003/";

class PackagingWorkshop extends React.Component {
  render() {
    let pack = this.props.properties.package ? <Package x={-this.props.x + 60} y={this.props.y + 25} numCups={6 - this.props.properties.freeSlots} /> : null;
    let packHead = this.props.properties.conveyorHead ? <Package x={-this.props.x + 261} y={this.props.y + 25} numCups={6} /> : null;
    return (
      <Group scaleX={-1}>
        <Arrow points={[-this.props.x - 90, this.props.y + 70, -this.props.x + 30, this.props.y + 70]} pointerWidth={5} pointerLength={5} fill='black' stroke='black' strokeWidth={0.5} />
        <Text x={-this.props.x - 105} y={this.props.y + 63.5} text='x' />
        <Arrow points={[-this.props.x + 70, this.props.y + 30, -this.props.x + 70, this.props.y + 100]} pointerWidth={5} pointerLength={5} fill='black' stroke='black' strokeWidth={0.5} />
        <Text x={-this.props.x + 72} y={this.props.y + 10} text='y' scaleX={-1} />
        <StackLight x={-this.props.x - 160} y={this.props.y + 40} color={this.props.properties.stackLight} />
        <ConveyorBelt x={-this.props.x - 110} y={this.props.y + 20} width={150} speed={this.props.properties.speed1} items={this.props.properties.itemsConveyor1.map(i => i / 1 + (0.1 * (1 - i / 1)))} />
        <PackageConveyorBelt x={-this.props.x + 108} y={this.props.y + 20} width={150} speed={this.props.properties.speed2} items={this.props.properties.itemsConveyor2.map(i => i / 1 + (0.1 * (1 - i / 1)))} />
        <Rect
          x={-this.props.x + 40}
          y={this.props.y + 20}
          width={20}
          height={20}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={-this.props.x + 40}
          y={this.props.y + 40}
          width={20}
          height={20}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
        <DoubleOpticalSensor x={-this.props.x + 49} y={this.props.y + 15} on1={!this.props.properties.cup1} on2={!this.props.properties.cup2} />
        <Rect
          x={-this.props.x + 258}
          y={this.props.y + 20}
          width={54}
          height={40}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
        <OpticalSensor x={-this.props.x + 83} y={this.props.y + 15} on={!this.props.properties.package} />
        {pack}
        {packHead}
        <PackageBuffer x={-this.props.x + 110} y={this.props.y + 70} stackSize={this.props.properties.packageBuffer} />
        <PackageRobot x={-this.props.x + 99} y={this.props.y - 65} posX={-this.props.properties.robotPos[0] * 2} posZ={-this.props.properties.robotPos[1] * 3} clamp={this.props.properties.clamp} />
      </Group>
    )
  }
}


class PackageRobot extends React.Component {
  render() {
    let cup = this.props.clamp ? <Package x={this.props.x + 11 + this.props.posX * 25} y={this.props.y + 90 - this.props.posZ * 15} numCups={0} /> : null;
    return (
      <Group>
        <Rect
          x={this.props.x + 20 + this.props.posX * 25}
          y={this.props.y + 75 - this.props.posZ * 15}
          width={30}
          height={5}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x + (this.props.clamp ? 25 : 20) + this.props.posX * 25}
          y={this.props.y + 80 - this.props.posZ * 15}
          width={5}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x + (this.props.clamp ? 40 : 45) + this.props.posX * 25}
          y={this.props.y + 80 - this.props.posZ * 15}
          width={5}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        {cup}
      </Group>
    )
  }
}

class PackageBuffer extends React.Component {
  render() {
    let pack = this.props.stackSize > 0 ? <Package x={this.props.x} y={this.props.y} numCups={0} /> : null;
    return (
      <Group>
        {pack}
        <Text
          scaleX={-1}
          fontSize={20}
          x={this.props.x + 30}
          y={this.props.y + 8}
          text={this.props.stackSize}
        />
      </Group>
    );
  }
}

class Package extends React.Component {
  render() {
    let cups = [];
    let i = 0;
    while (i < this.props.numCups) {
      cups.push(
        <Line
          key={i}
          points={[
            this.props.x + 3 + 16 * i % 48, this.props.y + 3 + Math.floor(i / 3) * 15,
            this.props.x + 5 + 16 * i % 48, this.props.y + 13 + Math.floor(i / 3) * 15,
            this.props.x + 11 + 16 * i % 48, this.props.y + 13 + Math.floor(i / 3) * 15,
            this.props.x + 13 + 16 * i % 48, this.props.y + 3 + Math.floor(i / 3) * 15,
          ]}
          stroke="black"
          strokeWidth={1}
        />
      );
      i++;
    }

    return (
      <Group>
        <Rect
          x={this.props.x}
          y={this.props.y}
          width={48}
          height={30}
          fill="white"
          stroke="black"
          strokeWidth={1}
        />
        <Line
          points={[
            this.props.x, this.props.y + 15,
            this.props.x + 48, this.props.y + 15,
          ]}
          stroke="black"
          strokeWidth={0.5}
        />
        <Line
          points={[
            this.props.x + 16, this.props.y,
            this.props.x + 16, this.props.y + 30,
          ]}
          stroke="black"
          strokeWidth={0.5}
        />
        <Line
          points={[
            this.props.x + 32, this.props.y,
            this.props.x + 32, this.props.y + 30,
          ]}
          stroke="black"
          strokeWidth={0.5}
        />
        {cups}
      </Group>
    );
  }
}

class RobotArm extends React.Component {
  render() {
    return (
      <Group>
        <Arrow points={[this.props.x + 90, this.props.y + 150, this.props.x + 40, this.props.y + 150]} pointerWidth={5} pointerLength={5} fill='black' stroke='black' strokeWidth={0.5} />
        <Text x={this.props.x + 28} y={this.props.y + 144} text='z' />
        <Arrow points={[this.props.x + 20, this.props.y + 120, this.props.x + 20, this.props.y + 180]} pointerWidth={5} pointerLength={5} fill='black' stroke='black' strokeWidth={0.5} />
        <Text x={this.props.x + 17} y={this.props.y + 100} text='x' />
        <StackLight x={this.props.x + 80} y={this.props.y + 63} color={this.props.properties.stackLight} />
        <Robot x={this.props.x} y={this.props.y} posX={1.6 - this.props.properties.robotPos[2] * 3} posZ={4.3 - this.props.properties.robotPos[0] * 3} clamp={this.props.properties.grasping} />
      </Group>
    )
  }
}

class FillingWorkshop extends React.Component {
  render() {
    let cupAtEnd = this.props.properties.conveyorHead ?
      <Line
        points={[
          this.props.x + 205, this.props.y + 115,
          this.props.x + 207, this.props.y + 125,
          this.props.x + 213, this.props.y + 125,
          this.props.x + 215, this.props.y + 115
        ]}
        stroke="black"
        strokeWidth={1}
      /> : null;
    return (
      <Group>
        <Arrow points={[this.props.x + 60, this.props.y + 150, this.props.x + 180, this.props.y + 150]} pointerWidth={5} pointerLength={5} fill='black' stroke='black' strokeWidth={0.5} />
        <Text x={this.props.x + 45} y={this.props.y + 144} text='x' />
        <Rect
          x={this.props.x + 200}
          y={this.props.y + 100}
          width={20}
          height={40}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
        <StackLight x={this.props.x + 180} y={this.props.y + 63} color={this.props.properties.stackLight} />
        <FillingRobot x={this.props.x + 5 + this.props.properties.robotPos[0] * 73} y={this.props.y + 30} valve={this.props.properties.magneticValve} tank={this.props.properties.tankLevel / 2.0} />
        <ConveyorBelt x={this.props.x} y={this.props.y + 100} width={200} speed={this.props.properties.speed} items={this.props.properties.itemsConveyor.map(i => i / 2.4 + (0.1 * (1 - i / 2.4)))} />
        <OpticalSensor x={this.props.x + 29} y={this.props.y + 95} on={!this.props.properties.opticalSensor} />
        <OpticalSensor x={this.props.x + 208.5} y={this.props.y + 95} on={!this.props.properties.conveyorHead} />
        {cupAtEnd}
      </Group>
    )
  }
}

class FillingRobot extends React.Component {
  render() {
    return (
      <Group>
        <Line
          points={[this.props.x, this.props.y, this.props.x + 50, this.props.y, this.props.x + 30, this.props.y + 30, this.props.x + 30, this.props.y + 40, this.props.x + 20, this.props.y + 40, this.props.x + 20, this.props.y + 30]}
          fill="gray"
          stroke="black"
          strokeWidth={1}
          closed={true}
        />
        <Line
          points={[this.props.x + 6 + (1 - this.props.tank) * 20.5, this.props.y + 3 + (1 - this.props.tank) * 30,
          this.props.x + 44 - (1 - this.props.tank) * 20.5, this.props.y + 3 + (1 - this.props.tank) * 30,
          this.props.x + 26.5, this.props.y + 30,
          this.props.x + 26.5, this.props.y + (this.props.valve ? 45 : 30),
          this.props.x + 23.5, this.props.y + (this.props.valve ? 45 : 30),
          this.props.x + 23.5, this.props.y + 30]}
          fill="#f9f7f1"
          closed={true}
        />
      </Group>
    );
  }
}

class DoubleOpticalSensor extends React.Component {
  render() {
    let laser1 = this.props.on1 ?
      <Rect
        x={this.props.x}
        y={this.props.y}
        width={2}
        height={25}
        fill="red"
      /> : <Line
        points={[
          this.props.x - 4, this.props.y + 10,
          this.props.x - 2, this.props.y + 20,
          this.props.x + 4, this.props.y + 20,
          this.props.x + 6, this.props.y + 10,
        ]}
        stroke="black"
        strokeWidth={1}
      />;
    let laser2 = this.props.on2 ?
      <Rect
        x={this.props.x}
        y={this.props.y + 25}
        width={2}
        height={25}
        fill="red"
      /> : <Line
        points={[
          this.props.x - 4, this.props.y + 30,
          this.props.x - 2, this.props.y + 40,
          this.props.x + 4, this.props.y + 40,
          this.props.x + 6, this.props.y + 30,
        ]}
        stroke="black"
        strokeWidth={1}
      />;
    return (
      <Group>
        {laser1}
        {laser2}
        <Rect
          x={this.props.x - 4}
          y={this.props.y - 5}
          width={10}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x - 4}
          y={this.props.y + 24}
          width={10}
          height={2}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x - 4}
          y={this.props.y + 45}
          width={10}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
      </Group>
    );
  }
}

class OpticalSensor extends React.Component {
  render() {
    let laser = this.props.on ?
      <Rect
        x={this.props.x}
        y={this.props.y}
        width={2}
        height={50}
        fill="red"
      /> : null;
    return (
      <Group>
        {laser}
        <Rect
          x={this.props.x - 4}
          y={this.props.y - 5}
          width={10}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x - 4}
          y={this.props.y + 45}
          width={10}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
      </Group>
    );
  }
}

class ConveyorWorkshop extends React.Component {
  render() {
    return (
      <Group>
        <Arrow points={[this.props.x + 50, this.props.y + 150, this.props.x + 150, this.props.y + 150]} pointerWidth={5} pointerLength={5} fill='black' stroke='black' strokeWidth={0.5} />
        <Text x={this.props.x + 35} y={this.props.y + 144} text='x' />
        <Arrow points={[this.props.x + 168, this.props.y + 80, this.props.x + 168, this.props.y + 10]} pointerWidth={5} pointerLength={5} fill='black' stroke='black' strokeWidth={0.5} />
        <Text x={this.props.x + 165.5} y={this.props.y + 84} text='z' />
        <ConveyorBelt x={this.props.x + 10} y={this.props.y + 100} width={200} speed={this.props.properties.speed} items={this.props.properties.itemsConveyor.map(i => i / 1.2 + 0.1)} />
        <StorageRack x={this.props.x + 10} y={this.props.y} items={this.props.properties.itemsRack} />
        <StackLight x={this.props.x + 177.5} y={this.props.y + 63} color={this.props.properties.stackLight} />
        <Robot x={this.props.x} y={this.props.y} posX={this.props.properties.robotPos[0]} posZ={this.props.properties.robotPos[2]} clamp={this.props.properties.clamp} />
      </Group>
    )
  }
}

class Robot extends React.Component {
  render() {
    let cup = this.props.clamp ?
      <Line
        points={[
          this.props.x + 30 + this.props.posX * 25, this.props.y + 80 - this.props.posZ * 15,
          this.props.x + 32 + this.props.posX * 25, this.props.y + 90 - this.props.posZ * 15,
          this.props.x + 38 + this.props.posX * 25, this.props.y + 90 - this.props.posZ * 15,
          this.props.x + 40 + this.props.posX * 25, this.props.y + 80 - this.props.posZ * 15
        ]}
        stroke="black"
        strokeWidth={1}
      /> : null;
    return (
      <Group>
        <Rect
          x={this.props.x + 20 + this.props.posX * 25}
          y={this.props.y + 75 - this.props.posZ * 15}
          width={30}
          height={5}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x + (this.props.clamp ? 25 : 20) + this.props.posX * 25}
          y={this.props.y + 80 - this.props.posZ * 15}
          width={5}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x + (this.props.clamp ? 40 : 45) + this.props.posX * 25}
          y={this.props.y + 80 - this.props.posZ * 15}
          width={5}
          height={10}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        {cup}
      </Group>
    )
  }
}

class StackLight extends React.Component {
  render() {
    let red = this.props.color === "red" ? "#ff0000" : "#770000";
    let yellow = this.props.color === "yellow" ? "#ffff00" : "#777700";
    let green = this.props.color === "green" ? "#00ff00" : "#007700";
    return (
      <Group>
        <Rect
          x={this.props.x + 0.5}
          y={this.props.y + 0.5}
          width={11}
          height={8}
          fill={red}
        />
        <Rect
          x={this.props.x + 0.5}
          y={this.props.y + 8.5}
          width={11}
          height={8}
          fill={yellow}
        />
        <Rect
          x={this.props.x + 0.5}
          y={this.props.y + 16.5}
          width={11}
          height={8}
          fill={green}
        />
        <Rect
          x={this.props.x}
          y={this.props.y}
          width={12}
          height={25}
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x}
          y={this.props.y + 25}
          width={12}
          height={12}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
      </Group>
    )
  }
}

class PackageConveyorBelt extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      'beltOffset': 0
    };
    this.tickBelt = this.tickBelt.bind(this);
  }

  componentDidMount() {
    this.intervalBelt = setInterval(this.tickBelt, 50);
  }

  componentWillUnmount() {
    clearImmediate(this.intervalBelt);
  }

  async tickBelt() {
    this.setState({ 'beltOffset': (this.state.beltOffset + this.props.speed * 8) % 30 });
  }

  render() {
    let packages = [];
    let i = 0;
    for (let c of this.props.items) {
      packages.push(
        <Package key={i} x={this.props.x + c * this.props.width} y={this.props.y} numCups={6} />
      );
      i++;
    }

    let arrows = [];
    for (let i = this.state.beltOffset; i < this.props.width - 5.5; i += 30) {
      arrows.push(
        <Line
          key={i}
          points={[this.props.x + i, this.props.y + 10, this.props.x + i, this.props.y + 30, this.props.x + 5.5 + i, this.props.y + 20]}
          fill="yellow"
          opacity={0.7}
          closed={true}
        />
      );
    }
    return (
      <Group>
        <Rect
          x={this.props.x}
          y={this.props.y}
          width={this.props.width}
          height={40}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x}
          y={this.props.y + 5}
          width={this.props.width}
          height={30}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        {arrows}
        {packages}
      </Group>
    )
  }
}

class ConveyorBelt extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      'beltOffset': 0
    };
    this.tickBelt = this.tickBelt.bind(this);
  }

  componentDidMount() {
    this.intervalBelt = setInterval(this.tickBelt, 50);
  }

  componentWillUnmount() {
    clearImmediate(this.intervalBelt);
  }

  async tickBelt() {
    this.setState({ 'beltOffset': (this.state.beltOffset + this.props.speed * 8) % 30 });
  }

  render() {
    let cups = [];
    let i = 0;
    for (let c of this.props.items) {
      cups.push(
        <Line
          key={i}
          points={[
            this.props.x + c * this.props.width, this.props.y + 15,
            this.props.x + 2 + c * this.props.width, this.props.y + 25,
            this.props.x + 8 + c * this.props.width, this.props.y + 25,
            this.props.x + 10 + c * this.props.width, this.props.y + 15,
          ]}
          stroke="black"
          strokeWidth={1}
        />
      );
      i++;
    }

    let arrows = [];
    for (let i = this.state.beltOffset; i < this.props.width - 5.5; i += 30) {
      arrows.push(
        <Line
          key={i}
          points={[this.props.x + i, this.props.y + 10, this.props.x + i, this.props.y + 30, this.props.x + 5.5 + i, this.props.y + 20]}
          fill="yellow"
          opacity={0.7}
          closed={true}
        />
      );
    }
    return (
      <Group>
        <Rect
          x={this.props.x}
          y={this.props.y}
          width={this.props.width}
          height={40}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
        <Rect
          x={this.props.x}
          y={this.props.y + 5}
          width={this.props.width}
          height={30}
          fill="gray"
          stroke="black"
          strokeWidth={1}
        />
        {arrows}
        {cups}
      </Group>
    )
  }
}

class StorageRack extends React.Component {
  render() {
    let slots = []
    for (let i = 0; i < 5; i++) {
      for (let j = 0; j < 5; j++) {
        if (this.props.items[i][4 - j]) {
          slots.push(
            <Line
              key={5 * i + j}
              points={[
                this.props.x + 20 + i * 25, this.props.y + 20 + j * 15,
                this.props.x + 22 + i * 25, this.props.y + 30 + j * 15,
                this.props.x + 28 + i * 25, this.props.y + 30 + j * 15,
                this.props.x + 30 + i * 25, this.props.y + 20 + j * 15,
              ]}
              stroke="black"
              strokeWidth={1}
            />
          );
        }
      }
    }
    return (
      <Group>
        <Rect
          x={this.props.x}
          y={this.props.y + 10}
          width={150}
          height={90}
          fill="lightgray"
          stroke="black"
          strokeWidth={1}
        />
        {slots}
      </Group>
    )
  }
}

class App extends Component {
  constructor() {
    super();
    this.state = {
      'workshops': {
        'conveyor': {
          'speed': 0,
          'itemsConveyor': [],
          'itemsRack': [
            [true, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
          ],
          'stackLight': "",
          'robotPos': [0, 0, 0],
          'clamp': false
        },
        'filling': {
          'robotPos': [0, 0, 0],
          'itemsConveyor': [],
          'speed': 0,
          'stackLight': '',
          'magneticValve': false,
          'opticalSensor': false,
          'conveyorHead': false,
          'tankLevel': false,
        },
        'robotArm': {
          'robotPos': [0, 0, 0],
          'grasping': false,
          'stackLight': '',
        },
        'packaging': {
          'robotPos': [0, 0, 0],
          'itemsConveyor1': [],
          'speed1': 0,
          'itemsConveyor2': [],
          'speed2': 0,
          'conveyorHead': false,
          'stackLight': '',
          'packageBuffer': 0,
          'freeSlots': 0,
          'cup1': false,
          'cup2': false,
          'package': false,
        },
      },
    }
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.interval = setInterval(this.tick, 500);
  }

  componentWillUnmount() {
    clearImmediate(this.interval);
  }

  async tick() {
    // OLD
    // fetch(HOST).then(res => res.json()).then(res => this.setState({
    //   'workshops': res,
    // }));

    const myHeaders = new Headers();

    const auth64 = btoa("simu" + simu + ":simu" + simu);
    myHeaders.append("Authorization", "Basic "+auth64);
    myHeaders.append("Content-Type", "application/json");
  

    const requestOptions = {
      headers: myHeaders,
      mode: 'cors',
    };

    fetch(HOST, requestOptions)
      .then((response) => {
        return response.json();
      })
      .then((result) => {this.setState({
        'workshops': result,
      });
    })
      .catch((error) => console.error(error));
  }
  render() {
    return (
      <div
        style={{
          display: 'flex',
        }}
      >
        <Stage width={1500} height={750} scaleX={2.7} scaleY={2.7}>
          <Layer>
            <Rect
              x={420}
              y={0}
              width={100}
              height={160}
              fill="red"
            />
            <Rect
              x={210}
              y={0}
              width={210}
              height={160}
              fill="#ffa500"
            />
            <Rect
              x={0}
              y={0}
              width={210}
              height={160}
              fill="#00a933"
            />
            <Rect
              x={0}
              y={160}
              width={520}
              height={110}
              fill="#0000cd"
            />
            <FillingWorkshop x={210} y={0} properties={this.state.workshops.filling} />
            <ConveyorWorkshop x={0} y={0} properties={this.state.workshops.conveyor} />
            <RobotArm x={420} y={0} properties={this.state.workshops.robotArm} />
            <PackagingWorkshop x={320} y={160} properties={this.state.workshops.packaging} />
          </Layer>
        </Stage>
      </div>
    );
  }
}

export default App;
