<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xml:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Statistiques</title>
        <link rel="stylesheet" type="text/css" href="../../style/public.css"/>
      </head>
      <body>
        <main>
          <section>
            <h1>Répartition du type de clients</h1>
            <ul>
              <li>
                <span>Nombre d'adultes</span>
                <span>
                  <xsl:value-of select="count(organisme/clients/client[@typePublic='adulte'])"/>
                </span>
              </li>
              <li>
                <span>Nombre de familles</span>
                <span>
                  <xsl:value-of select="count(organisme/clients/client[@typePublic='famille'])"/>
                </span>
              </li>
              <li>
                <span>Nombre d'enfants/adolescents</span>
                <span>
                  <xsl:value-of select="count(organisme/clients/client[@typePublic='enfant_adolescent'])"/>
                </span>
              </li>
            </ul>
          </section>
          <section>
            <h1>Répartition des langues des professeurs</h1>
            <ul>
              <li>
                <span>Anglais</span>
                <span>
                  <xsl:value-of select="count(organisme/enseignants/enseignant[langue = 'anglais'])"/>
                </span>
              </li>
              <li>
                <span>Français</span>
                <span>
                  <xsl:value-of select="count(organisme/enseignants/enseignant[langue = 'francais'])"/>
                </span>
              </li>
              <li>
                <span>Italien</span>
                <span>
                  <xsl:value-of select="count(organisme/enseignants/enseignant[langue = 'italien'])"/>
                </span>
              </li>
              <li>
                <span>Espagnol</span>
                <span>
                  <xsl:value-of select="count(organisme/enseignants/enseignant[langue = 'espagnol'])"/>
                </span>
              </li>
              <li>
                <span>Allemand</span>
                <span>
                  <xsl:value-of select="count(organisme/enseignants/enseignant[langue = 'allemand'])"/>
                </span>
              </li>
            </ul>
          </section>
          <section>
            <h1>Répartition des langues de séjours</h1>
            <ul>
              <li>
                <span>Anglais</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[langue = 'anglais'])"/>
                </span>
              </li>
              <li>
                <span>Français</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[langue = 'francais'])"/>
                </span>
              </li>
              <li>
                <span>Italien</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[langue = 'italien'])"/>
                </span>
              </li>
              <li>
                <span>Espagnol</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[langue = 'espagnol'])"/>
                </span>
              </li>
              <li>
                <span>Allemand</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[langue = 'allemand'])"/>
                </span>
              </li>
            </ul>
          </section>
          <section>
            <h1>Répartition des cibles de séjours</h1>
            <ul>
              <li>
                <span>Séjours adultes</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[typePublic = 'adulte'])"/>
                </span>
              </li>
              <li>
                <span>Séjours familles</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[typePublic = 'famille'])"/>
                </span>
              </li>
              <li>
                <span>Séjours enfants/adolescents</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[typePublic = 'enfant_adolescent'])"/>
                </span>
              </li>
            </ul>
          </section>
          <section>
            <h1>Répartition des types de séjours</h1>
            <ul>
              <li>
                <span>Immersions en famille</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[@typeSejour = 'immersion_en_famille'])"/>
                </span>
              </li>
              <li>
                <span>Stages linguistiques</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[@typeSejour = 'stage_linguistique'])"/>
                </span>
              </li>
              <li>
                <span>Colonies de vacances</span>
                <span>
                  <xsl:value-of select="count(organisme/sejours/sejour[@typeSejour = 'colonie_de_vacances'])"/>
                </span>
              </li>
            </ul>
          </section>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>