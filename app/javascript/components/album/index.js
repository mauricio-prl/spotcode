import React, {Fragment} from 'react';
import { Image, Heading } from 'react-bulma-components';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

const SpacedDiv = styled.div`
  margin-top: 10px;
`
 
const Album = (props) => {
  return(
    <Fragment>
      <Link to={`/albums/${props.id}`}>
        <Image src={props.cover_url}/> {/*it is the same that <img src={props.cover_url} className='image'/>*/}
        <SpacedDiv>
          <Heading size={6} className='has-text-white'>{props.title}</Heading>
          <Heading size={6} className='has-text-white' subtitle>{props.artist_name}</Heading>
        </SpacedDiv>
      </Link>
    </Fragment>
  );
}

export default Album;
