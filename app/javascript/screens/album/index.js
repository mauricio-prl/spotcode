import React, { Fragment } from 'react';
import Albums from '../../components/albums';
import SectionWrapper from '../../components/common/section_wrapper';
import NavbarFooter from '../../components/common/navbar_footer';

const AlbumScreen = () => {
  return (
    <Fragment>
      <SectionWrapper>
        <Albums />
        <NavbarFooter />
      </SectionWrapper>
    </Fragment>
  );
};

export default AlbumScreen;
