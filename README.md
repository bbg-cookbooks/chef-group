Description
===========

A group cookbook, modeled after fnichol's chef-user cookbook.
Setup groups via databags.

Requirements
============

none

Attributes
==========

- a groups databag filled with your groups
- a node attribute node['groups'] which will be an array of the groups you want on the system.

Usage
=====

To use `recipe[group::data_bag]`, include it in your run\_list and have a
data bag called `"groups"` with an item like the following:

    {
      "id"        : "deploy",
      "gid"       : "6001"
      "members"  : ["deploy"]
    }
