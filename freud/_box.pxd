# Copyright (c) 2010-2020 The Regents of the University of Michigan
# This file is from the freud project, released under the BSD 3-Clause License.

from libcpp.memory cimport shared_ptr
from libcpp.vector cimport vector
from libcpp cimport bool
from freud.util cimport vec3
from libcpp.vector cimport vector
from libcpp.string cimport string
cimport freud._locality

ctypedef unsigned int uint

cdef extern from "Box.h" namespace "freud::box":
    cdef cppclass Box:
        Box()
        Box(float, bool)
        Box(float, float, float, bool)
        Box(float, float, float, float, float, float, bool)

        void setL(vec3[float])
        void setL(float, float, float)

        void set2D(bool)
        bool is2D() const

        float getLx() const
        float getLy() const
        float getLz() const

        vec3[float] getL() const
        vec3[float] getLinv() const

        float getTiltFactorXY() const
        float getTiltFactorXZ() const
        float getTiltFactorYZ() const

        void setTiltFactorXY(float)
        void setTiltFactorXZ(float)
        void setTiltFactorYZ(float)

        float getVolume() const
        void makeAbsolute(vec3[float]*, unsigned int) const
        void makeFractional(vec3[float]*, unsigned int) const
        void getImage(vec3[float]*, unsigned int, vec3[int]*) const
        void wrap(vec3[float]* vs, unsigned int Nv) const
        void unwrap(vec3[float]*, const vec3[int]*,
                    unsigned int) const
        vec3[float] centerOfMass(vec3[float]*, size_t, float*) const
        void center(vec3[float]*, size_t, float*) const
        void computeDistances(vec3[float]*, unsigned int,
                              vec3[float]*, unsigned int, float*
                              ) except +
        void computeAllDistances(vec3[float]*, unsigned int,
                                 vec3[float]*, unsigned int, float*)

        vec3[bool] getPeriodic() const
        bool getPeriodicX() const
        bool getPeriodicY() const
        bool getPeriodicZ() const
        void setPeriodic(bool, bool, bool)
        void setPeriodicX(bool)
        void setPeriodicY(bool)
        void setPeriodicZ(bool)
