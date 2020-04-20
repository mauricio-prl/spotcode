import React, { Fragment } from 'react';
import { Navbar, Container, Columns } from 'react-bulma-components';
import logoImage from '../../../assets/images/logo.png';
import styled from 'styled-components';
 
const ColumnsFullWidth = styled(Columns)`
  width: 100%;
  padding-top: 20px;
  padding-left: 10px;
  padding-bottom: 10px;
`

const Menu = () => {
  return (
    <Fragment>
      <Navbar color="dark">
        <Container>
          <ColumnsFullWidth className='is-mobile'>
            <Columns.Column desktop={{size: 2}} mobile={{size: 5}}>
              <img src={logoImage} className='image'/>
            </Columns.Column>
            <Columns.Column>
            </Columns.Column>
          </ColumnsFullWidth>
        </Container>
      </Navbar>
    </Fragment>
  );
}

export default Menu;
