import { Container, Typography } from '@mui/material'
import Form from './Form';
import List from './List';

function App() {
  return (
    <Container>
      <Typography variant='h1'>My Todo App</Typography>
      <Form />
      <List />
    </Container>
  )
}

export default App
