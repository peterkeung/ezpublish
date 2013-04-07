<?php
/**
 * File containing the eZFS2FileHandlerTest class
 *
 * @copyright Copyright (C) 1999-2010 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/gnu_gpl GNU GPLv2
 * @package tests
 */

/**
 * eZFS2FileHandler tests
 * @group cluster
 * @group eZFS2
 */
class eZFS2FileHandlerTest extends eZClusterFileHandlerAbstractTest
{
    protected $backupGlobals = false;

    protected $clusterClass = 'eZFS2FileHandler';

    /**
     * Test setup
     *
     * Load an instance of file.ini
     **/
    public function setUp()
    {
        parent::setUp();

        // We need to clear the existing handler if it was loaded before the INI
        // settings changes
        eZClusterFileHandler::resetHandler();

        // Load database parameters for cluster
        // The same DSN than the relational database is used
        ezpINIHelper::setINISetting( 'file.ini', 'ClusteringSettings', 'FileHandler', $this->clusterClass );
    }

    public function tearDown()
    {
        ezpINIHelper::restoreINISettings();
        eZClusterFileHandler::resetHandler();

        parent::tearDown();
    }

    /**
     * Test for the fetchUnique() method
     *
     * Doesn't do much with eZFS. Nothing, actually.
     */
    public function testFetchUnique()
    {
        $testFile = 'var/tests/' . __FUNCTION__ . '/file.txt';
        $this->createFile( $testFile, "contents" );

        $clusterHandler = eZClusterFileHandler::instance( $testFile );
        $fetchedFile = $clusterHandler->fetchUnique();

        self::assertSame( $testFile, $fetchedFile, "A unique name should have been returned" );

        self::deleteLocalFiles( $testFile, $fetchedFile );
    }

    /*public function testStartCacheGeneration()
    {
        self::assertTrue( eZClusterFileHandler::instance()->startCacheGeneration() );
    }*/

    /*public function testEndCacheGeneration()
    {
        self::assertTrue( eZClusterFileHandler::instance()->endCacheGeneration() );
    }*/

    /*public function testAbortCacheGeneration()
    {
        self::assertTrue( eZClusterFileHandler::instance()->abortCacheGeneration() );
    }*/

    /*public function testCheckCacheGenerationTimeout()
    {
        self::assertTrue( eZClusterFileHandler::instance()->abortCacheGeneration() );
    }*/
}
?>
